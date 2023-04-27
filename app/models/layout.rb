class Layout < ApplicationRecord
    has_many :plots
    before_save :update_layout_columns

    def update_layout_columns
        self.sold = 0
        self.pending = self.total_plots
        self.amt_sold = 0
    end

    def self.update_plot_count(id)
        layout = Layout.find(id)
        puts "Start"
        puts layout
        amt_sold = Plot.where(layout_id: id).sum(:total_amt)
        # puts layout
        puts amt_sold

        layout.update(sold: layout.sold + 1, pending: layout.pending - 1, amt_sold: amt_sold)
        puts layout
        # layout.sold += 1
        # layout.pending -= 1
        layout.save
        puts "Layout Columns Updated"
    end
end
