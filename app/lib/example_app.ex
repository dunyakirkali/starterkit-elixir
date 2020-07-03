defmodule ExampleApp do
  def hello(args) do
    Application.ensure_all_started(:inets)
    Application.ensure_all_started(:ssl)

    [server_url, player_key] = args |> String.split(" ")

    IO.inspect(server_url, label: "server_url")
    IO.inspect(player_key, label: "player_key")

    {:ok, {{_, 200, 'OK'}, _headers, body}} =
      :httpc.request(:get, {"#{server_url}?playerKey=#{player_key}" |> to_charlist, []}, [], [])

    IO.inspect(body)
  end
end
