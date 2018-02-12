class PmeController < ApplicationController
  def signal_send
    if(params['signal'] == '1')
      data = MyJsonClass.where(:subscribed => false, :mac => params['Mac'])
      render json: {result: data}, status:200
      data.update_all(:subscribed => true)
    else
      render json: {result:MyJsonClass.where(:mac => params['Mac'])}
    end
  end

  def signal_receive
    data = params['PME']
    data.each do |record|
      MyJsonClass.create(activity: record['Activity'],
                         vector0:  record['Vector0'],
                         vector1:  record['Vector1'],
                         vector2:  record['Vector2'],
                         time:     record['Time'],
                         mac:      record['Mac'])
    end

    render json: {result:"Saved in DataBase"}, status:200

  end

  def signal_test

    render json: {result:MyJsonClass.all}, status:200
  end
end
