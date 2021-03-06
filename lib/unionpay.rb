require File.dirname(__FILE__) + '/unionpay/conf'
require File.dirname(__FILE__) + '/unionpay/service'
require File.dirname(__FILE__) + '/unionpay/version'
require File.dirname(__FILE__) + '/unionpay/utils'

module UnionPay
  class << self
    attr_accessor :mer_id, :security_key, :mer_abbr, :environment

    def mer_id= v
      UnionPay::PayParams['merId'] = v
    end

    def mer_abbr= v
      UnionPay::PayParams['merAbbr'] = v
    end

    def environment= e
      case e
      ## 测试环境
      when :development
        self.front_pay_url = "https://101.231.204.80:5000/gateway/api/frontTransReq.do"
        self.back_pay_url = "https://101.231.204.80:5000/gateway/api/backTransReq.do"
        self.app_pay_url = "https://101.231.204.80:5000/gateway/api/appTransReq.do"
        self.query_url = "https://101.231.204.80:5000/gateway/api/queryTrans.do"
      ## 预上线环境
      when :pre_production
        self.front_pay_url = "http://www.epay.lxdns.com/UpopWeb/api/Pay.action"
        self.back_pay_url = "http://www.epay.lxdns.com/UpopWeb/api/BSPay.action"
        self.query_url = "http://www.epay.lxdns.com/UpopWeb/api/Query.action"
      ## 线上环境
      else
        self.front_pay_url = "https://unionpaysecure.com/api/Pay.action"
        self.back_pay_url = "https://besvr.unionpaysecure.com/api/BSPay.action"
        self.query_url = "https://query.unionpaysecure.com/api/Query.action"
      end
    end
  end
  self.environment= :production
end
