module YUML
  # Create a new Activity Diagram
  def self.activityDiagram( *options, &block )
    ActivityDiagram.new( *options, &block )
  end
  
  # Create a new Activity Diagram
  class ActivityDiagram < Diagram
    def initialize( *options, &block )
      @options = {
        :diagram => "activity"
      }
      options.each do |op|
        if op.class == Hash
          @options = @options.merge( op )
        else
          @options[op] = true
        end
      end

      @links = []
      
      # SPECIFIC !!!
      @activities = {}
      @decisions = {}
      @parallels = {}
      
      instance_eval(&block)
    end
    
    # Create a activity in a Activity Diagram
    def activity(x)
      @activities[x] ||= Activity.new( self, x )
    end
    
    # Create a start in a Activity Diagram
    def _start_
      @activities[:Start] ||= Activity.new( self, :Start )
    end

    # Create a end in a Activity Diagram
    def _end_
      @activities[:End] ||= Activity.new( self, :End )
    end
    
    # Create a decision in an Activity Diagram
    def decision(x)
      @decisions[x] ||= Decision.new( self, x )
    end
    
    # Create a parallel in an Activity Diagram
    def parallel(x)
      @parallels[x] ||= Parallel.new( self, x )
    end
    
    def _(x=nil, &b)
      if x.nil?
        if b
          decision(b.call)
        else
          Parallel.new(self, nil)
        end
      else
        activity(x)
      end
    end
    
  end
end