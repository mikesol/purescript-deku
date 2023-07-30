module Deku.DOM.Attr.OnSuspend where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSuspend = OnSuspend

instance Attr anything OnSuspend Cb where
  attr OnSuspend bothValues  = unsafeAttribute $ Both { key: "suspend", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "suspend", value:  cb' value  })
  pureAttr OnSuspend value  = unsafeAttribute $ This { key: "suspend", value:  cb' value  }
  unpureAttr OnSuspend eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "suspend", value:  cb' value  }

instance Attr anything OnSuspend (Effect Unit) where
  attr OnSuspend bothValues  = unsafeAttribute $ Both { key: "suspend", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "suspend", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnSuspend value  = unsafeAttribute $ This { key: "suspend", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnSuspend eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "suspend", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnSuspend (Effect Boolean) where
  attr OnSuspend bothValues  = unsafeAttribute $ Both { key: "suspend", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "suspend", value:  cb' (Cb (const value))  })
  pureAttr OnSuspend value  = unsafeAttribute $ This { key: "suspend", value:  cb' (Cb (const value))  }
  unpureAttr OnSuspend eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "suspend", value:  cb' (Cb (const value))  }

type OnSuspendEffect =
  forall element
   . Attr element OnSuspend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSuspend Unit where
  attr OnSuspend bothValues  = unsafeAttribute $ Both { key: "suspend", value:  unset'  } (snd bothValues <#> \_ -> { key: "suspend", value:  unset'  })
  pureAttr OnSuspend _  = unsafeAttribute $ This { key: "suspend", value:  unset'  }
  unpureAttr OnSuspend eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "suspend", value:  unset'  }
