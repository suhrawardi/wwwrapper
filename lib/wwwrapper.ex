defmodule Wwwrapper do
  #use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  #def start(_type, _args) do
  #  Wwwrapper.Supervisor.start_link
  #end

  def main(argv) do
    Wwwrapper.CLI.run(argv)
  end
end
