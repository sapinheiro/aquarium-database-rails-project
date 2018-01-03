class Event < ApplicationRecord
def title_date 
    "#{title}: #{event_date}"
end
end
