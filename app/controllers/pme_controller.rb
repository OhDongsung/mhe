class PmeController < ApplicationController
  def signal_send
    if(params['signal'] == '1')
      data = MyJsonClass.where(:subscribed => false)
      render json: {result: data}, status:200
      data.update_all(:subscribed => true)
    else
      render json: {result:MyJsonClass.all}
    end
  end

  def signal_receive
    data = params['PME']
    data.each do |record|
      MyJsonClass.create(activity: record['Activity'],
                         vector0:  record['Vector0'],
                         vector1:  record['Vector1'],
                         vector2:  record['Vector2'],
                         time:     record['Time'])
    end

    render json: {result:"Saved in DataBase"}, status:200

  end

  def signal_test
    MyJsonClass.create(activity: "1",
                       vector0:  "151",
                       vector1:  "207",
                       vector2:  "0",
                       time:     "2018-02-09 09:23:34")

    render json: {result:MyJsonClass.all}, status:200
  end
end
