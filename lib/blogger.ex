defmodule Blogger do

  # question 1
  def fetch_blog() do
    HTTPoison.get! "https://medium.com/podiihq/quick-connect-to-your-amazon-ec2-linux-instance-through-the-command-line-6c682960ef91"
  end

  # question 2
  # function that takes input list and returns the list in uppercase
  def to_upper(list \\ []) do

    Enum.map(list, &(String.upcase(&1)))

  end


  # Function to print to the console the todo name, pass the url as an argument when running from the portal
  def get_title() do

    case HTTPoison.get "https://jsonplaceholder.typicode.com/todos/1" do
        {:ok, %{body: raw, status_code: code}} -> {code, raw}
        {:error, %{reason: reason}} -> {:error, reason}
      end
      |> case do
        {_ok, body} -> Poison.decode(body)
      end
      |> fn
        {_ok, map} -> IO.puts map["title"]
      end.()



    end


end
