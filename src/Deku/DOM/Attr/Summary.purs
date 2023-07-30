module Deku.DOM.Attr.Summary where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Summary = Summary

instance Attr Table_ Summary String where
  attr Summary bothValues  = unsafeAttribute $ Both { key: "summary", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "summary", value:  prop' value  })
  pureAttr Summary value  = unsafeAttribute $ This { key: "summary", value:  prop' value  }
  unpureAttr Summary eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "summary", value:  prop' value  }

instance Attr everything Summary Unit where
  attr Summary bothValues  = unsafeAttribute $ Both { key: "summary", value:  unset'  } (snd bothValues <#> \_ -> { key: "summary", value:  unset'  })
  pureAttr Summary _  = unsafeAttribute $ This { key: "summary", value:  unset'  }
  unpureAttr Summary eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "summary", value:  unset'  }
