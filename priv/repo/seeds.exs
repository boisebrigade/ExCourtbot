alias Courtbot.{Case, Repo, User}

# Debug case. This case can be used to do a health check.
if Case.find_with([case_number: "BEEPBOOP"]) === nil && System.get_env("MIX_ENV") != "test" do
  %Case{
    case_number: "BEEPBOOP",
    formatted_case_number: "BEEPBOOP"
  } |> Repo.insert!
end

if Mix.env == :dev do
  Repo.insert! %User{
    id: "cc4c18ca-8d97-4557-8a1f-4ac88da2dba6",
    user_name: "admin",
    password_hash: "$2b$12$9Ch07l8XACmUPVszsWcNL.7LuOBgYk/LBeIOrAaRcu3W1xwgK5hRO"
  }
end
