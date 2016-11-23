defmodule Mix.Tasks.Caster.ExportNotes do
  use Mix.Task
  import Mix.Ecto
  import Ecto.Query

  @shortdoc "Export notes to file"
  def run(_args, notes_file \\ Application.get_env(:caster, :notes_export_file)) do
    repo = Caster.Repo
    ensure_repo(repo, [])
    ensure_started(repo, [])
    casts = repo.all(from v in Caster.Cast,
      where: not(is_nil(v.note)) and v.note != "",
      order_by: [desc: v.updated_at])

    notes = casts
            |> Enum.map_join("\n\n", &format_note/1)

    File.write!(notes_file, to_charlist(notes), [:write, :utf8])
  end

  defp format_note(%{note: note, url: nil, title: title}) do
    "### #{title}\n#{note}"
  end

  defp format_note(%{note: note, url: url, title: title}) do
    "### [#{title}](#{url})\n#{note}"
  end
end
