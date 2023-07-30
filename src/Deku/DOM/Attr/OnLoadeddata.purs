module Deku.DOM.Attr.OnLoadeddata where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadeddata = OnLoadeddata

instance Attr anything OnLoadeddata Cb where
  attr OnLoadeddata bothValues  = unsafeAttribute $ Both { key: "loadeddata", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "loadeddata", value:  cb' value  })
  pureAttr OnLoadeddata value  = unsafeAttribute $ This { key: "loadeddata", value:  cb' value  }
  unpureAttr OnLoadeddata eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loadeddata", value:  cb' value  }

instance Attr anything OnLoadeddata (Effect Unit) where
  attr OnLoadeddata bothValues  = unsafeAttribute $ Both { key: "loadeddata", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "loadeddata", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnLoadeddata value  = unsafeAttribute $ This { key: "loadeddata", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnLoadeddata eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loadeddata", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnLoadeddata (Effect Boolean) where
  attr OnLoadeddata bothValues  = unsafeAttribute $ Both { key: "loadeddata", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "loadeddata", value:  cb' (Cb (const value))  })
  pureAttr OnLoadeddata value  = unsafeAttribute $ This { key: "loadeddata", value:  cb' (Cb (const value))  }
  unpureAttr OnLoadeddata eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loadeddata", value:  cb' (Cb (const value))  }

type OnLoadeddataEffect =
  forall element
   . Attr element OnLoadeddata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadeddata Unit where
  attr OnLoadeddata bothValues  = unsafeAttribute $ Both { key: "loadeddata", value:  unset'  } (snd bothValues <#> \_ -> { key: "loadeddata", value:  unset'  })
  pureAttr OnLoadeddata _  = unsafeAttribute $ This { key: "loadeddata", value:  unset'  }
  unpureAttr OnLoadeddata eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "loadeddata", value:  unset'  }
