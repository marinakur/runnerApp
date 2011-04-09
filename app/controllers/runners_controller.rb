class RunnersController < ApplicationController
  # GET /runners
  # GET /runners.xml
  def index
    #NewRelic::Agent::add_custom_parameters("param1" => "blah")
    #@test = NewRelic::Agent.agent.stats_engine.get_stats_no_scope('Custom/Test/Blah')
    @runners = Runner.all
    #marina:adding sleep
    sleep 2

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @runners }
    end
  end

  # GET /runners/1
  # GET /runners/1.xml
  def show
    @runner = Runner.find(params[:id])
    #marina: adding sleep
    sleep 2
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @runner }
    end
  end

  # GET /runners/new
  # GET /runners/new.xml
  def new
    #marina: adding sleep
    sleep 2
    @runner = Runner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @runner }
    end
  end

  # GET /runners/1/edit
  def edit
    #marina: adding sleep
    sleep 2 
    @runner = Runner.find(params[:id])
  end

  # POST /runners
  # POST /runners.xml
  def create
    @runner = Runner.new(params[:runner])

    respond_to do |format|
      if @runner.save
        format.html { redirect_to(@runner, :notice => 'Runner was successfully created.') }
        format.xml  { render :xml => @runner, :status => :created, :location => @runner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @runner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /runners/1
  # PUT /runners/1.xml
  def update
    @runner = Runner.find(params[:id])

    respond_to do |format|
      if @runner.update_attributes(params[:runner])
        format.html { redirect_to(@runner, :notice => 'Runner was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @runner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /runners/1
  # DELETE /runners/1.xml
  def destroy
   #adding sleep by marina:
    sleep 2 
    @runner = Runner.find(params[:id])
    @runner.destroy

    respond_to do |format|
      format.html { redirect_to(runners_url) }
      format.xml  { head :ok }
    end
  end
end
