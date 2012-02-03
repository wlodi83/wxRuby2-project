require "wx"
include Wx 

class MainFrame < Wx::Frame
  def initialize
    super(nil,
         :title => "RadioBox",
         :pos   => [150, 25],
         :size  => [600, 480]
    )

  panel = Wx::Panel.new(self)

  datetime_choices = ["day", "week", "month", "year"]

  radios = Wx::RadioBox.new(
    panel,
    :label           => "Chose for which period should be used this query",
    :pos             => [20, 5],
    :size            => Wx::DEFAULT_SIZE,
    :choices         => datetime_choices,
    :major_dimension => 1,
    :style           => Wx::RA_SPECIFY_COLS
  )

  evt_radiobox(radios.get_id()) {|cmd_event| on_change_radio(cmd_event)}

  @text_widget = Wx::StaticText.new(
    panel,
    :label => "day",
    :pos   => [150, 25],
    :size  => Wx::DEFAULT_SIZE
  )

  show
  end

  def on_change_radio(cmd_event)
    selected_date = cmd_event.string
    @text_widget.label = selected_date
  end

end
 
class MinimalApp < Wx::App
  def on_init
    MainFrame.new
  end
end

MinimalApp.new.main_loop
