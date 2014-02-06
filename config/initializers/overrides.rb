Paperclip::Attachment.class_eval do

=begin
  def post_process_style(name, style) #:nodoc:
    begin
      raise RuntimeError.new("Style #{name} has no processors defined.") if style.processors.blank?
      original_file = @queued_for_write[:original]
      @queued_for_write[name] = style.processors.inject(@queued_for_write[:original]) do |file, processor|
        new_file = Paperclip.processor(processor).make(file, style.processor_options, self)
        file.close unless file == original_file #&& !file.closed?
        new_file
      end
      unadapted_file = @queued_for_write[name]
      @queued_for_write[name] = Paperclip.io_adapters.for(@queued_for_write[name])
      unadapted_file.close if unadapted_file.respond_to?(:close)
      @queued_for_write[name]
    rescue Paperclip::Error => e
      log("An error was received while processing: #{e.inspect}")
      (@errors[:processing] ||= []) << e.message if @options[:whiny]
    end
  end
=end
end