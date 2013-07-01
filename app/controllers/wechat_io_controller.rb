# encoding: utf-8
class WechatIoController < ApplicationController
  before_filter :check_weixin_legality
  def check
    render :text => params[:echostr]
  end

  def in_out
    if params[:xml][:MsgType] == "text"
      @content = params[:xml][:Content]
    elsif params[:xml][:MsgType] == "event"
      @content = '欢迎你加入卵崽俱乐部!'
    end
    render "in_out", :formats => :xml
  end

  private
  # 根据参数校验请求是否合法，如果非法返回错误页面
  def check_weixin_legality
    array = [Rails.configuration.wechat_token, params[:timestamp], params[:nonce]].sort
    render :text => "Forbidden", :status => 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
  end
end
