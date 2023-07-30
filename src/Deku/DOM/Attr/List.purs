module Deku.DOM.Attr.List where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data List = List

instance Attr Input_ List String where
  attr List bothValues  = unsafeAttribute $ Both { key: "list", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "list", value:  prop' value  })
  pureAttr List value  = unsafeAttribute $ This { key: "list", value:  prop' value  }
  unpureAttr List eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "list", value:  prop' value  }

instance Attr everything List Unit where
  attr List bothValues  = unsafeAttribute $ Both { key: "list", value:  unset'  } (snd bothValues <#> \_ -> { key: "list", value:  unset'  })
  pureAttr List _  = unsafeAttribute $ This { key: "list", value:  unset'  }
  unpureAttr List eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "list", value:  unset'  }
