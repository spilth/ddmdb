class AddReleaseDateToReleases < ActiveRecord::Migration
  def self.up
    add_column :releases, :released_on, :date
    add_index :releases, :released_on
    
    # data
    data = {
      1 => {'released_on' => Date.new(2003, 9, 26)},
      2 => {'released_on' => Date.new(2003, 12, 19)},
      3 => {'released_on' => Date.new(2004, 3, 25)},
      4 => {'released_on' => Date.new(2004, 6, 18)},
      5 => {'released_on' => Date.new(2004, 10, 14)},
      6 => {'released_on' => Date.new(2005, 3, 24)},
      7 => {'released_on' => Date.new(2005, 7, 21)},
      8 => {'released_on' => Date.new(2005, 11, 3)},
      9 => {'released_on' => Date.new(2006, 3, 3)},
      10 => {'released_on' => Date.new(2006, 7, 7)},
      11 => {'released_on' => Date.new(2006, 8, 1)},
      13 => {'released_on' => Date.new(2006, 11, 6)},
      15 => {'released_on' => Date.new(2007, 3, 5)},
      16 => {'released_on' => Date.new(2007, 7, 6)},
      17 => {'released_on' => Date.new(2007, 10, 26)},
      18 => {'released_on' => Date.new(2008, 3, 28)},
      19 => {'released_on' => Date.new(2008, 7, 12)},
      20 => {'released_on' => Date.new(2008, 11, 7)},
      21 => {'released_on' => Date.new(2007, 9, 1)},
      24 => {'released_on' => Date.new(2009, 5, 19)},
      26 => {'released_on' => Date.new(2009, 8, 18)},
      27 => {'released_on' => Date.new(2009, 11, 17)},
      28 => {'released_on' => Date.new(2010, 9, 21)},
      30 => {'released_on' => Date.new(2010, 6, 15)}
    }
    Release.update(data.keys, data.values)
  end

  def self.down
    remove_index :releases, :released_on
    remove_column :releases, :released_on
  end
end
