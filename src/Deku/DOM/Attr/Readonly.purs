module Deku.DOM.Attr.Readonly where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Readonly = Readonly

instance Attr Input_ Readonly String where
  attr Readonly bothValues  = unsafeAttribute $ Both { key: "readonly", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "readonly", value:  prop' value  })
  pureAttr Readonly value  = unsafeAttribute $ This { key: "readonly", value:  prop' value  }
  unpureAttr Readonly eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "readonly", value:  prop' value  }

instance Attr Textarea_ Readonly String where
  attr Readonly bothValues  = unsafeAttribute $ Both { key: "readonly", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "readonly", value:  prop' value  })
  pureAttr Readonly value  = unsafeAttribute $ This { key: "readonly", value:  prop' value  }
  unpureAttr Readonly eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "readonly", value:  prop' value  }

instance Attr everything Readonly Unit where
  attr Readonly bothValues  = unsafeAttribute $ Both { key: "readonly", value:  unset'  } (snd bothValues <#> \_ -> { key: "readonly", value:  unset'  })
  pureAttr Readonly _  = unsafeAttribute $ This { key: "readonly", value:  unset'  }
  unpureAttr Readonly eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "readonly", value:  unset'  }
