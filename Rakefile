require File.dirname(__FILE__) + '/helpers'
include FileUtils

HOME_FOLDER = File.expand_path("~")
INSTALLATION_PATH = join_path(HOME_FOLDER, ".vim_on_rails")
BACKUP_PATH = join_path(INSTALLATION_PATH, "backup")
FILES_TO_BACKUP = %w( .vim .vimrc .gvimrc )

task :install do
  #backup .vim folder and .vimrc and .gvimrc
  backup_current_environment


  #create folder structure
  #copy .vimrc and .gvimrc files
  #install colorscheme
  #install vundle
  #execute vim +"BundleInstall"
end

task :uninstall do
  restore_backup_environment
  delete_installation_folder
end

def backup_current_environment
  mkdir_p(BACKUP_PATH)
  FILES_TO_BACKUP.each do |file| 
    mv(join_path(HOME_FOLDER, file), BACKUP_PATH, :noop => true)
  end
end

def restore_backup_environment
  FILES_TO_BACKUP.each do |file| 
    mv(join_path(BACKUP_PATH, file), HOME_FOLDER, :noop => true)
  end
end

def delete_installation_folder
  rm_r(INSTALLATION_PATH)
end
