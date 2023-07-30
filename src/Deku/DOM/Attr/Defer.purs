module Deku.DOM.Attr.Defer where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Defer = Defer

instance Attr Script_ Defer String where
  attr Defer bothValues  = unsafeAttribute $ Both { key: "defer", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "defer", value:  prop' value  })
  pureAttr Defer value  = unsafeAttribute $ This { key: "defer", value:  prop' value  }
  unpureAttr Defer eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "defer", value:  prop' value  }

instance Attr everything Defer Unit where
  attr Defer bothValues  = unsafeAttribute $ Both { key: "defer", value:  unset'  } (snd bothValues <#> \_ -> { key: "defer", value:  unset'  })
  pureAttr Defer _  = unsafeAttribute $ This { key: "defer", value:  unset'  }
  unpureAttr Defer eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "defer", value:  unset'  }
