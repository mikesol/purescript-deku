module Deku.DOM.Attr.Formmethod where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formmethod = Formmethod

instance Attr Button_ Formmethod String where
  attr Formmethod bothValues  = unsafeAttribute $ Both { key: "formmethod", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "formmethod", value:  prop' value  })
  pureAttr Formmethod value  = unsafeAttribute $ This { key: "formmethod", value:  prop' value  }
  unpureAttr Formmethod eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "formmethod", value:  prop' value  }

instance Attr Input_ Formmethod String where
  attr Formmethod bothValues  = unsafeAttribute $ Both { key: "formmethod", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "formmethod", value:  prop' value  })
  pureAttr Formmethod value  = unsafeAttribute $ This { key: "formmethod", value:  prop' value  }
  unpureAttr Formmethod eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "formmethod", value:  prop' value  }

instance Attr everything Formmethod Unit where
  attr Formmethod bothValues  = unsafeAttribute $ Both { key: "formmethod", value:  unset'  } (snd bothValues <#> \_ -> { key: "formmethod", value:  unset'  })
  pureAttr Formmethod _  = unsafeAttribute $ This { key: "formmethod", value:  unset'  }
  unpureAttr Formmethod eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "formmethod", value:  unset'  }
