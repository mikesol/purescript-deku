module Deku.DOM.Attr.OnInput where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnInput = OnInput

instance Attr anything OnInput Cb where
  attr OnInput bothValues  = unsafeAttribute $ Both { key: "input", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "input", value:  cb' value  })
  pureAttr OnInput value  = unsafeAttribute $ This { key: "input", value:  cb' value  }
  unpureAttr OnInput eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "input", value:  cb' value  }

instance Attr anything OnInput (Effect Unit) where
  attr OnInput bothValues  = unsafeAttribute $ Both { key: "input", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "input", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnInput value  = unsafeAttribute $ This { key: "input", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnInput eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "input", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnInput (Effect Boolean) where
  attr OnInput bothValues  = unsafeAttribute $ Both { key: "input", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "input", value:  cb' (Cb (const value))  })
  pureAttr OnInput value  = unsafeAttribute $ This { key: "input", value:  cb' (Cb (const value))  }
  unpureAttr OnInput eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "input", value:  cb' (Cb (const value))  }

type OnInputEffect =
  forall element
   . Attr element OnInput (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnInput Unit where
  attr OnInput bothValues  = unsafeAttribute $ Both { key: "input", value:  unset'  } (snd bothValues <#> \_ -> { key: "input", value:  unset'  })
  pureAttr OnInput _  = unsafeAttribute $ This { key: "input", value:  unset'  }
  unpureAttr OnInput eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "input", value:  unset'  }
