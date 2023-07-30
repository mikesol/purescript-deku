module Deku.DOM.Attr.Size where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Size = Size

instance Attr Input_ Size String where
  attr Size bothValues  = unsafeAttribute $ Both { key: "size", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "size", value:  prop' value  })
  pureAttr Size value  = unsafeAttribute $ This { key: "size", value:  prop' value  }
  unpureAttr Size eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "size", value:  prop' value  }

instance Attr Select_ Size String where
  attr Size bothValues  = unsafeAttribute $ Both { key: "size", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "size", value:  prop' value  })
  pureAttr Size value  = unsafeAttribute $ This { key: "size", value:  prop' value  }
  unpureAttr Size eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "size", value:  prop' value  }

instance Attr everything Size Unit where
  attr Size bothValues  = unsafeAttribute $ Both { key: "size", value:  unset'  } (snd bothValues <#> \_ -> { key: "size", value:  unset'  })
  pureAttr Size _  = unsafeAttribute $ This { key: "size", value:  unset'  }
  unpureAttr Size eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "size", value:  unset'  }
