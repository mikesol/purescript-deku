module Deku.DOM.Attr.OnMouseout where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseout = OnMouseout

instance Attr anything OnMouseout Cb where
  attr OnMouseout bothValues  = unsafeAttribute $ Both { key: "mouseout", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "mouseout", value:  cb' value  })
  pureAttr OnMouseout value  = unsafeAttribute $ This { key: "mouseout", value:  cb' value  }
  unpureAttr OnMouseout eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseout", value:  cb' value  }

instance Attr anything OnMouseout (Effect Unit) where
  attr OnMouseout bothValues  = unsafeAttribute $ Both { key: "mouseout", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "mouseout", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnMouseout value  = unsafeAttribute $ This { key: "mouseout", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnMouseout eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseout", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnMouseout (Effect Boolean) where
  attr OnMouseout bothValues  = unsafeAttribute $ Both { key: "mouseout", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "mouseout", value:  cb' (Cb (const value))  })
  pureAttr OnMouseout value  = unsafeAttribute $ This { key: "mouseout", value:  cb' (Cb (const value))  }
  unpureAttr OnMouseout eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mouseout", value:  cb' (Cb (const value))  }

type OnMouseoutEffect =
  forall element
   . Attr element OnMouseout (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseout Unit where
  attr OnMouseout bothValues  = unsafeAttribute $ Both { key: "mouseout", value:  unset'  } (snd bothValues <#> \_ -> { key: "mouseout", value:  unset'  })
  pureAttr OnMouseout _  = unsafeAttribute $ This { key: "mouseout", value:  unset'  }
  unpureAttr OnMouseout eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "mouseout", value:  unset'  }
