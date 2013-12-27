def wait_for_jquery
  counter = 0
  while page.execute_script('return $.active').to_i > 0
    counter += 1
    sleep(0.1)
    raise 'Interrupted: JQuery activity took longer than 5 seconds.' if counter >= 50
  end
end
