module Deku.DOM.Attr.Scope where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scope = Scope

instance Attr Th_ Scope String where
  attr Scope bothValues  = unsafeAttribute $ Both { key: "scope", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "scope", value:  prop' value  })
  pureAttr Scope value  = unsafeAttribute $ This { key: "scope", value:  prop' value  }
  unpureAttr Scope eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "scope", value:  prop' value  }

instance Attr everything Scope Unit where
  attr Scope bothValues  = unsafeAttribute $ Both { key: "scope", value:  unset'  } (snd bothValues <#> \_ -> { key: "scope", value:  unset'  })
  pureAttr Scope _  = unsafeAttribute $ This { key: "scope", value:  unset'  }
  unpureAttr Scope eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "scope", value:  unset'  }
