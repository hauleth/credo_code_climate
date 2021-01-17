defmodule CredoCodeClimate do
  import Credo.Plugin

  alias Credo.Execution

  defmodule Generate do
    use Credo.Execution.Task

    def call(exec, _opts) do
      case Execution.get_command_name(exec) do
        "suggest" -> do_run(exec)
        _ -> exec
      end
    end

    defp do_run(exec) do
      path = Execution.get_plugin_param(exec, CredoCodeClimate, :path) || "codeclimate.json"
      content =
        exec
        |> Execution.get_issues()
        |> Enum.map(&format/1)
        |> Jason.encode_to_iodata!()

      File.write!(path, content)

      exec
    end

    defp format(%{
      priority: priority,
      filename: path,
      line_no: line,
      message: description
    } = entry) do
      fingerprint =
        entry
        |> :erlang.term_to_binary()
        |> hash()

      %{
        severity: severity(priority),
        description: description,
        fingerprint: fingerprint,
        location: %{
          path: path,
          lines: %{
            start: line
          }
        }
      }
    end

    defp severity(p) when p >= 30, do: "blocker"
    defp severity(p) when p in 20..29, do: "critical"
    defp severity(p) when p in 10..19, do: "major"
    defp severity(p) when p >= 0, do: "minor"
    defp severity(_), do: "info"

    defp hash(bin), do: :crypto.hash(:sha256, bin) |> Base.encode16(case: :lower)
  end

  def init(exec) do
    append_task(exec, :run_command, Generate)
  end
end
