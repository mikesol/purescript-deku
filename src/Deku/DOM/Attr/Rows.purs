module Deku.DOM.Attr.Rows where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rows = Rows

instance Attr Textarea_ Rows String where
  attr Rows bothValues  = unsafeAttribute $ Both { key: "rows", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "rows", value:  prop' value  })
  pureAttr Rows value  = unsafeAttribute $ This { key: "rows", value:  prop' value  }
  unpureAttr Rows eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "rows", value:  prop' value  }

instance Attr everything Rows Unit where
  attr Rows bothValues  = unsafeAttribute $ Both { key: "rows", value:  unset'  } (snd bothValues <#> \_ -> { key: "rows", value:  unset'  })
  pureAttr Rows _  = unsafeAttribute $ This { key: "rows", value:  unset'  }
  unpureAttr Rows eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "rows", value:  unset'  }
