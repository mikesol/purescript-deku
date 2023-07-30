module Deku.DOM.Attr.FilterRes where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterRes = FilterRes

instance Attr Filter_ FilterRes String where
  attr FilterRes bothValues  = unsafeAttribute $ Both { key: "filterRes", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "filterRes", value:  prop' value  })
  pureAttr FilterRes value  = unsafeAttribute $ This { key: "filterRes", value:  prop' value  }
  unpureAttr FilterRes eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "filterRes", value:  prop' value  }

instance Attr everything FilterRes Unit where
  attr FilterRes bothValues  = unsafeAttribute $ Both { key: "filterRes", value:  unset'  } (snd bothValues <#> \_ -> { key: "filterRes", value:  unset'  })
  pureAttr FilterRes _  = unsafeAttribute $ This { key: "filterRes", value:  unset'  }
  unpureAttr FilterRes eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "filterRes", value:  unset'  }
