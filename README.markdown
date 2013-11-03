# Usage

To use this gem, simply include it in your Gemfile and invoke it as so:

    results = MyModel.select("something AS something_else").counting { |arel| arel.except(:select) }
    # Invokes the block so the select clause is removed, avoiding a bug in Rails.
    size = results.count
    # Includes the select as desired.
    values = results.load
