module Deku.DOM.Attr.Allow where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Allow = Allow

instance Attr Iframe_ Allow String where
  attr Allow bothValues  = unsafeAttribute $ Both { key: "allow", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "allow", value:  prop' value  })
  pureAttr Allow value  = unsafeAttribute $ This { key: "allow", value:  prop' value  }
  unpureAttr Allow eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "allow", value:  prop' value  }

instance Attr everything Allow Unit where
  attr Allow bothValues  = unsafeAttribute $ Both { key: "allow", value:  unset'  } (snd bothValues <#> \_ -> { key: "allow", value:  unset'  })
  pureAttr Allow _  = unsafeAttribute $ This { key: "allow", value:  unset'  }
  unpureAttr Allow eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "allow", value:  unset'  }
