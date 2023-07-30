module Deku.DOM.Attr.Data where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Data = Data

instance Attr Object_ Data String where
  attr Data bothValues  = unsafeAttribute $ Both { key: "data", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "data", value:  prop' value  })
  pureAttr Data value  = unsafeAttribute $ This { key: "data", value:  prop' value  }
  unpureAttr Data eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "data", value:  prop' value  }

instance Attr everything Data Unit where
  attr Data bothValues  = unsafeAttribute $ Both { key: "data", value:  unset'  } (snd bothValues <#> \_ -> { key: "data", value:  unset'  })
  pureAttr Data _  = unsafeAttribute $ This { key: "data", value:  unset'  }
  unpureAttr Data eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "data", value:  unset'  }
