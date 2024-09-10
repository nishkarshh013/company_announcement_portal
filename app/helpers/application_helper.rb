module ApplicationHelper

	def comment_timestamp(comment)
		if comment.created_at > 1.day.ago
			"#{time_ago_in_words(comment.created_at)} ago"
		else
			comment.created_at.strftime("%b %d, %Y at %I:%M %p")
		end
	end
end
