module Deku.DOM.Attr.OnVolumechange where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnVolumechange = OnVolumechange

instance Attr anything OnVolumechange Cb where
  attr OnVolumechange bothValues  = unsafeAttribute $ Both { key: "volumechange", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "volumechange", value:  cb' value  })
  pureAttr OnVolumechange value  = unsafeAttribute $ This { key: "volumechange", value:  cb' value  }
  unpureAttr OnVolumechange eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "volumechange", value:  cb' value  }

instance Attr anything OnVolumechange (Effect Unit) where
  attr OnVolumechange bothValues  = unsafeAttribute $ Both { key: "volumechange", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "volumechange", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnVolumechange value  = unsafeAttribute $ This { key: "volumechange", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnVolumechange eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "volumechange", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnVolumechange (Effect Boolean) where
  attr OnVolumechange bothValues  = unsafeAttribute $ Both { key: "volumechange", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "volumechange", value:  cb' (Cb (const value))  })
  pureAttr OnVolumechange value  = unsafeAttribute $ This { key: "volumechange", value:  cb' (Cb (const value))  }
  unpureAttr OnVolumechange eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "volumechange", value:  cb' (Cb (const value))  }

type OnVolumechangeEffect =
  forall element
   . Attr element OnVolumechange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnVolumechange Unit where
  attr OnVolumechange bothValues  = unsafeAttribute $ Both { key: "volumechange", value:  unset'  } (snd bothValues <#> \_ -> { key: "volumechange", value:  unset'  })
  pureAttr OnVolumechange _  = unsafeAttribute $ This { key: "volumechange", value:  unset'  }
  unpureAttr OnVolumechange eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "volumechange", value:  unset'  }
