msg_file = File.join(Rails.root, 'config', 'status_codes.yml')
StatusCodes = YAML.load(File.open(msg_file)) if msg_file
