class Message < ActsAsMessageable::Message
  acts_as_taggable_on :labels
  #TODO: Generate indexed column for search
  include ::PgSearch::Model
  pg_search_scope :by_text,
                  against: %i[topic body],
                  using: {
                    tsearch: {
                      dictionary: "spanish"
                      #   tsvector_column: "searchable"
                    },
                    trigram: {
                      word_similarity: true
                    },
                    dmetaphone: {
                    }
                  },
                  ignoring: :accents
end
