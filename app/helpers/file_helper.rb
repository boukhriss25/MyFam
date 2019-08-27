module FileHelper
  def is_document?(file)
    %w[pdf doc docx].include?(file.format)
  end

  def is_image?(file)
    %w[png jpeg jpg].include?(file.format)
  end
end
