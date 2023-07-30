module Deku.DOM.Attr.OnPointerlockerror where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerlockerror = OnPointerlockerror

instance Attr anything OnPointerlockerror Cb where
  attr OnPointerlockerror bothValues  = unsafeAttribute $ Both { key: "pointerlockerror", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "pointerlockerror", value:  cb' value  })
  pureAttr OnPointerlockerror value  = unsafeAttribute $ This { key: "pointerlockerror", value:  cb' value  }
  unpureAttr OnPointerlockerror eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "pointerlockerror", value:  cb' value  }

instance Attr anything OnPointerlockerror (Effect Unit) where
  attr OnPointerlockerror bothValues  = unsafeAttribute $ Both { key: "pointerlockerror", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "pointerlockerror", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnPointerlockerror value  = unsafeAttribute $ This { key: "pointerlockerror", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnPointerlockerror eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "pointerlockerror", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnPointerlockerror (Effect Boolean) where
  attr OnPointerlockerror bothValues  = unsafeAttribute $ Both { key: "pointerlockerror", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "pointerlockerror", value:  cb' (Cb (const value))  })
  pureAttr OnPointerlockerror value  = unsafeAttribute $ This { key: "pointerlockerror", value:  cb' (Cb (const value))  }
  unpureAttr OnPointerlockerror eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "pointerlockerror", value:  cb' (Cb (const value))  }

type OnPointerlockerrorEffect =
  forall element
   . Attr element OnPointerlockerror (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerlockerror Unit where
  attr OnPointerlockerror bothValues  = unsafeAttribute $ Both { key: "pointerlockerror", value:  unset'  } (snd bothValues <#> \_ -> { key: "pointerlockerror", value:  unset'  })
  pureAttr OnPointerlockerror _  = unsafeAttribute $ This { key: "pointerlockerror", value:  unset'  }
  unpureAttr OnPointerlockerror eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "pointerlockerror", value:  unset'  }
