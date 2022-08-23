defmodule Blogger do

  # question 1
  def fetch_blog() do
    HTTPoison.get! "https://medium.com/podiihq/quick-connect-to-your-amazon-ec2-linux-instance-through-the-command-line-6c682960ef91"
  end

  # question 2
  # function that takes input list and returns the list in uppercase
  def to_upper(list \\ []) do

    Enum.map(list, fn x -> String.upcase(x) end)

  end

  # question 3
  def get_title() do
    HTTPoison.get! "https://jsonplaceholder.typicode.com/todos/1"
  end

  # Function to print to the console the todo name, pass the url as an argument when running from the portal
  def get(url, headers \\ []) do

    url
    |> HTTPoison.get(headers)
    |> case do
        {:ok, %{body: raw, status_code: code}} -> {code, raw}
        {:error, %{reason: reason}} -> {:error, reason}
      end
    |> (fn {ok, body} ->
          body
          |> Poison.decode(keys: :atoms)
          |> case do

              {:ok, parsed} -> {ok, parsed}

              IO.puts(parsed.title)

              _ -> {:error, body}
            end
        end).()


    end


end
