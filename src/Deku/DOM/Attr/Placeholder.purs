module Deku.DOM.Attr.Placeholder where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Placeholder = Placeholder

instance Attr Input_ Placeholder String where
  attr Placeholder bothValues  = unsafeAttribute $ Both { key: "placeholder", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "placeholder", value:  prop' value  })
  pureAttr Placeholder value  = unsafeAttribute $ This { key: "placeholder", value:  prop' value  }
  unpureAttr Placeholder eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "placeholder", value:  prop' value  }

instance Attr Textarea_ Placeholder String where
  attr Placeholder bothValues  = unsafeAttribute $ Both { key: "placeholder", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "placeholder", value:  prop' value  })
  pureAttr Placeholder value  = unsafeAttribute $ This { key: "placeholder", value:  prop' value  }
  unpureAttr Placeholder eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "placeholder", value:  prop' value  }

instance Attr everything Placeholder Unit where
  attr Placeholder bothValues  = unsafeAttribute $ Both { key: "placeholder", value:  unset'  } (snd bothValues <#> \_ -> { key: "placeholder", value:  unset'  })
  pureAttr Placeholder _  = unsafeAttribute $ This { key: "placeholder", value:  unset'  }
  unpureAttr Placeholder eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "placeholder", value:  unset'  }
