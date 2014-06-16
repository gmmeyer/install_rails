include ActionView::Helpers::AssetTagHelper

require_relative("choose_os")
require_relative("choose_os_version")
require_relative("railsinstaller")
require_relative("install_xcode")
require_relative("find_the_command_line")
require_relative("verify_ruby_version")
require_relative("update_ruby")
require_relative("verify_rails_version")
require_relative("update_rails")
require_relative("install_homebrew")
require_relative("install_git")
require_relative("configure_git")
require_relative("install_rvm_and_ruby")
require_relative("find_git_bash")
require_relative("install_rails")
require_relative("sublime_text")
require_relative("textmate")
require_relative("create_your_first_app")
require_relative("see_it_live")
require_relative("congratulations")
require_relative("rails_for_linux_and_other")

choose_os_step = Step.create(title: "Choose OS", content: choose_os, first_step: true, prompt: "NA", mixpanel: "choose_your_os", save_user_choice: true)
choose_os_version_step = Step.create(title: "Choose OS Version", content: choose_os_version, prompt: "NA", prompt: "Select your version of Mac OS X", save_user_choice: true)
Edge.create(previous_step_id: choose_os_step.id, next_step_id: choose_os_version_step.id, button_text: "Mac", os: "Mac")

rails_installer_windows_step = Step.create(title: "Railsinstaller Windows", content: rails_installer_windows)
Edge.create(previous_step_id: choose_os_step.id, next_step_id: rails_installer_windows_step.id, button_text: "Windows", os: "Windows")

linux_and_other_step = Step.create(title: "Rails for Linux and Other", content: rails_for_linux_and_other, final_step: true)
Edge.create(previous_step_id: choose_os_step.id, next_step_id: linux_and_other_step.id, button_text: "Other", os: "Other")


rails_installer_step = Step.create(title: "Railsinstaller", content: rails_installer)
install_xcode_step = Step.create(title: "Install XCode", content: install_xcode)

Edge.create(previous_step_id: choose_os_version_step.id, next_step_id:  install_xcode_step.id, os: "Mac", os_version: "10.9", button_text: "10.9")
Edge.create(previous_step_id: choose_os_version_step.id, next_step_id: rails_installer_step.id, os: "Mac", os_version: "10.8", button_text: "10.8")
Edge.create(previous_step_id: choose_os_version_step.id, next_step_id: rails_installer_step.id, os: "Mac", os_version: "10.7", button_text: "10.7")
Edge.create(previous_step_id: choose_os_version_step.id, next_step_id: rails_installer_step.id, os: "Mac", os_version: "10.6", button_text: "10.6")
Edge.create(previous_step_id: choose_os_version_step.id, next_step_id:  install_xcode_step.id, os: "Mac", os_version: "10.5", button_text: "10.5 or below")

find_the_command_line_step = Step.create(title: "Find The Command Line", content: find_the_command_line)

Edge.create(previous_step_id: install_xcode_step.id, next_step_id: find_the_command_line_step.id, os: "Mac", os_version: "10.9")
Edge.create(previous_step_id: install_xcode_step.id, next_step_id: find_the_command_line_step.id, os: "Mac", os_version: "10.5")
Edge.create(previous_step_id: rails_installer_step.id, next_step_id: find_the_command_line_step.id, os: "Mac", os_version: "10.8")
Edge.create(previous_step_id: rails_installer_step.id, next_step_id: find_the_command_line_step.id, os: "Mac", os_version: "10.6")
Edge.create(previous_step_id: rails_installer_step.id, next_step_id: find_the_command_line_step.id, os: "Mac", os_version: "10.7")

verify_ruby_version_step = Step.create(title: "Verify Ruby Version", content: verify_ruby_version, save_user_choice: true, prompt: "What version of Ruby do you have?")

Edge.create(previous_step_id: find_the_command_line_step.id, next_step_id: verify_ruby_version_step.id, os: "Mac", os_version: "10.8")
Edge.create(previous_step_id: find_the_command_line_step.id, next_step_id: verify_ruby_version_step.id, os: "Mac", os_version: "10.7")
Edge.create(previous_step_id: find_the_command_line_step.id, next_step_id: verify_ruby_version_step.id, os: "Mac", os_version: "10.7")

update_ruby_step = Step.create(title: "Update Ruby", content: update_ruby)

verify_rails_version_step = Step.create(title: "Verify Rails Version", content: verify_rails_version, save_user_choice: true, prompt: "What version of Rails do you have?")

Edge.create(previous_step_id: verify_ruby_version_step.id, next_step_id: update_ruby_step.id, button_text: "1.9", ruby_version: "1.9")
Edge.create(previous_step_id: verify_ruby_version_step.id,next_step_id: update_ruby_step.id, button_text: "1.8", ruby_version: "1.8")
Edge.create(previous_step_id: verify_ruby_version_step.id, next_step_id: verify_rails_version_step.id, button_text: "2.0", ruby_version: "2.0")

Edge.create(previous_step_id: update_ruby_step.id, next_step_id: verify_rails_version_step.id, ruby_version: "1.9")
Edge.create(previous_step_id: update_ruby_step.id, next_step_id: verify_rails_version_step.id, ruby_version: "1.8")

update_rails_step = Step.create(title: "Update Rails", content: update_rails)

install_homebrew_step = Step.create(title: "Install Homebrew", content: install_homebrew)

Edge.create(previous_step_id: find_the_command_line_step.id, next_step_id: install_homebrew_step.id, os: "Mac", os_version: "10.9")
Edge.create(previous_step_id: find_the_command_line_step.id, next_step_id: install_homebrew_step.id, os: "Mac", os_version: "10.5")

install_git_step = Step.create(title: "Install Git", content: install_git)

Edge.create(previous_step_id: install_homebrew_step.id, next_step_id: install_git_step.id, single_edge: true)

configure_git_step = Step.create(title: "Configure Git", content: configure_git)

Edge.create(next_step_id: configure_git_step.id, previous_step_id: install_git_step.id, os: "Mac", os_version: "10.9")
Edge.create(next_step_id: configure_git_step.id, previous_step_id: install_git_step.id, os: "Mac", os_version: "10.5")

Edge.create(previous_step_id: verify_rails_version_step.id, next_step_id: configure_git_step.id, rails_version: "4.0", button_text: 4.0)
Edge.create(previous_step_id: update_rails_step.id, next_step_id: configure_git_step.id, rails_version: "3.2", button_text: "3.2")

install_rails_step = Step.create(title: "Install Rails", content: install_rails)

Edge.create(previous_step_id: update_rails_step.id, next_step_id: install_rails_step.id, rails_version: "Nothing! I get an error!", button_text: "Nothing! I get an error!")

Edge.create(previous_step_id: install_rails_step.id, next_step_id: configure_git_step.id, rails_version: "Nothing! I get an error!")

find_git_bash_step = Step.create(title: "Find Git Bash", content: find_git_bash)
Edge.create(previous_step_id: rails_installer_windows_step.id, next_step_id: find_git_bash_step.id)

Edge.create(previous_step_id: find_git_bash_step.id, next_step_id: install_rails_step.id, os: "Windows")

install_rvm_and_ruby_step = Step.create(title: "Install RVM and Ruby", content: install_rvm_and_ruby)

Edge.create(previous_step_id: configure_git_step.id, next_step_id: install_rvm_and_ruby_step.id, os_version: "10.9")
Edge.create(previous_step_id: configure_git_step.id, next_step_id: install_rvm_and_ruby_step.id, os_version: "10.5")

Edge.create(previous_step_id: install_rvm_and_ruby_step.id, next_step_id: install_rails_step.id, os_version: "10.9")
Edge.create(previous_step_id: install_rvm_and_ruby_step.id, next_step_id: install_rails_step.id, os_version: "10.5")

textmate_step = Step.create(title: "TextMate", content: textmate)

Edge.create(previous_step_id: install_rails_step.id, next_step_id: textmate_step.id, os_version: "10.5")

sublime_text_step = Step.create(title: 'Sublime Text', content: sublime_text)

Edge.create(previous_step_id: install_rails_step.id, next_step_id: sublime_text_step.id, os_version: "10.9")
Edge.create(previous_step_id: install_rails_step.id, next_step_id: sublime_text_step.id, os: "Windows")

Edge.create(previous_step_id: install_rails_step.id, next_step_id: sublime_text_step.id, os_version: "10.8")
Edge.create(previous_step_id: install_rails_step.id, next_step_id: sublime_text_step.id, os_version: "10.7")
Edge.create(previous_step_id: install_rails_step.id, next_step_id: sublime_text_step.id, os_version: "10.6")

create_your_first_app_step = Step.create(title: "Create Your First App", content: create_your_first_app)

Edge.create(previous_step_id: textmate_step.id, next_step_id: create_your_first_app_step.id, os_version: "10.5")
Edge.create(previous_step_id: sublime_text_step.id, next_step_id: create_your_first_app_step.id, os_version: "10.9")
Edge.create(previous_step_id: sublime_text_step.id, next_step_id: create_your_first_app_step.id, os_version: "10.8")
Edge.create(previous_step_id: sublime_text_step.id, next_step_id: create_your_first_app_step.id, os_version: "10.7")
Edge.create(previous_step_id: sublime_text_step.id, next_step_id: create_your_first_app_step.id, os_version: "10.6")
Edge.create(previous_step_id: sublime_text_step.id, next_step_id: create_your_first_app_step.id, os: "Windows")

see_it_live_step = Step.create(title: "See It Live", content: see_it_live)

Edge.create(previous_step_id: create_your_first_app_step.id, next_step_id: see_it_live_step.id)


congratulations_step = Step.create(title: "Congratulations", content: congrats, final_step: true, mixpanel: "Congratulations")

Edge.create(previous_step_id: create_your_first_app_step.id, next_step_id: congratulations_step.id)