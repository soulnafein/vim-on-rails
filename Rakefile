require File.dirname(__FILE__) + '/helpers'
include FileUtils

HOME_FOLDER = File.expand_path("~")
INSTALLATION_PATH = join_path(HOME_FOLDER, ".vim_on_rails")
BACKUP_PATH = join_path(INSTALLATION_PATH, "backup")
FILES_TO_BACKUP = %w( .vim .vimrc .gvimrc )

task :install => [:backup, :install_configuration] do
  install_vundle
  install_plugins
end

task :backup do
  backup_current_environment
end

task :install_configuration do
  install_config_files
end

task :uninstall do
  restore_backup_environment
  delete_installation_folder
end

def backup_current_environment
  mkdir_p(BACKUP_PATH)
  FILES_TO_BACKUP.each do |file| 
    mv_if_exists(join_path(HOME_FOLDER, file), BACKUP_PATH)
  end
end

def restore_backup_environment
  rm_r(join_path(HOME_FOLDER, '.vim'))
  FILES_TO_BACKUP.each do |file| 
    mv_if_exists(join_path(BACKUP_PATH, file), HOME_FOLDER)
  end
end

def delete_installation_folder
  rm_r(INSTALLATION_PATH)
end

def install_config_files
  cp(%w( .vimrc ), HOME_FOLDER)
end

def install_vundle
  vundle_installation_folder = join_path(HOME_FOLDER, '.vim')
  vundle_git_repo = "http://github.com/gmarik/vundle.git"
  system "git clone #{vundle_git_repo}  #{vundle_installation_folder}"
  mkdir_p(join_path(HOME_FOLDER, '.vim/swaps'))
end

def install_plugins
  cd INSTALLATION_PATH
  system 'vim +"BundleInstall" +"quit"'
end
