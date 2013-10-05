require 'guard'
require 'guard/guard'
require 'guard/lilypond/version'

require 'pathname'

module Guard
  class Lilypond < Guard

    # Initializes a Guard plugin.
    # Don't do any work here, especially as Guard plugins get initialized even if they are not in an active group!
    #
    # @param [Array<Guard::Watcher>] watchers the Guard plugin file watchers
    # @param [Hash] options the custom Guard plugin options
    # @option options [Symbol] group the group this Guard plugin belongs to
    # @option options [Boolean] any_return allow any object to be returned from a watcher
    #
    def initialize(watchers = [], options = {})
      super
    end

    # Called once when Guard starts. Please override initialize method to init stuff.
    #
    # @raise [:task_has_failed] when start has failed
    # @return [Object] the task result
    #
    def start
      ::Guard::UI.info 'GuardLilypond: started', :reset => true
    end

    # Called on file(s) additions that the Guard plugin watches.
    #
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_additions has failed
    # @return [Object] the task result
    #
    def run_on_additions(paths)
      compile_files(paths)
    end

    # Called on file(s) modifications that the Guard plugin watches.
    #
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_modifications has failed
    # @return [Object] the task result
    #
    def run_on_modifications(paths)
      compile_files(paths)
    end

    # Called on file(s) removals that the Guard plugin watches.
    #
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_removals has failed
    # @return [Object] the task result
    #
    def run_on_removals(paths)
      paths.each do |path|
        ::Guard::UI.info "GuardLilypond: removed #{path}", :reset => true
      end
    end

    private

    def compile_files(paths)
      paths.each do |path|
        ::Guard::UI.info "GuardLilypond: compiling #{path}", :reset => true

        pathname = Pathname.new(path)

        dirname = pathname.dirname.to_s
        filename = pathname.basename.to_s

        Dir.chdir(dirname) do
          system("lilypond #{filename}")
        end
      end
    end
  end
end
