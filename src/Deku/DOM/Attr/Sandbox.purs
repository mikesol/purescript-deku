module Deku.DOM.Attr.Sandbox where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sandbox = Sandbox

instance Attr Iframe_ Sandbox String where
  attr Sandbox bothValues  = unsafeAttribute $ Both { key: "sandbox", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "sandbox", value:  prop' value  })
  pureAttr Sandbox value  = unsafeAttribute $ This { key: "sandbox", value:  prop' value  }
  unpureAttr Sandbox eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "sandbox", value:  prop' value  }

instance Attr everything Sandbox Unit where
  attr Sandbox bothValues  = unsafeAttribute $ Both { key: "sandbox", value:  unset'  } (snd bothValues <#> \_ -> { key: "sandbox", value:  unset'  })
  pureAttr Sandbox _  = unsafeAttribute $ This { key: "sandbox", value:  unset'  }
  unpureAttr Sandbox eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "sandbox", value:  unset'  }
