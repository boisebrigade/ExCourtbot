defmodule CourtbotTest.GenHelper do
  @moduledoc false
  use ExUnitProperties

  def date(format) do
    gen all year <- integer(1970..2050),
            month <- integer(1..12),
            day <- integer(1..31),
            match?({:ok, _}, Date.from_erl({year, month, day})) do
      Timex.format!(Date.from_erl!({year, month, day}), format, :strftime)
    end
  end

  def time(format) do
    gen all hour <- integer(0..23),
            minute <- integer(0..59),
            second <- integer(0..59) do
      Timex.format!(Time.from_erl!({hour, minute, second}), format, :strftime)
    end
  end

  def case_number(prefix \\ "CR", delimiter \\ "-") do
    gen all year <- integer(0..50),
            county_id <- integer(0..50),
            case_num <- integer(10_000..99_999) do
      "#{prefix}#{year}#{delimiter}#{county_id}#{delimiter}#{case_num}"
    end
  end

  def county, do: csv_string(max_length: 1)

  def case_style do
    gen all first_one <- first_name(),
            last_one <- last_name(),
            first_two <- first_name(),
            last_two <- last_name() do
      "#{first_one} #{last_one} vs #{first_two} #{last_two}"
    end
  end

  def first_name, do: csv_string()
  def last_name, do: csv_string()

  def hearing_location, do: csv_string()
  def hearing_type, do: csv_string()

  defp csv_string(opts \\ []) do
    gen all string <- string(:ascii, opts) do
      string
      |> String.replace("\r", "")
      |> String.replace("\n", "")
      |> String.replace(",", "")
      |> String.replace("\t", "")
      |> String.replace("\"", "")
      |> String.replace("'", "")
    end
  end
end
