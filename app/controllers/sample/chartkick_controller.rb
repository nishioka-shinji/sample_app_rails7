class Sample::ChartkickController < ApplicationController
  def show
    @data = [['2019-06-01', 100], ['2019-06-02', 200], ['2019-06-03', 150]]
  end
end
