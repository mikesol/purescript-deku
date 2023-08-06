module Deku.DOM.Attr.OnVolumechange where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnVolumechange = OnVolumechange

instance Attr anything OnVolumechange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both (pure 
    { key: "volumechange", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "volumechange", value: cb' value })
instance Attr anything OnVolumechange (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnVolumechange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "volumechange", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "volumechange", value: cb' value })
instance Attr anything OnVolumechange  Cb  where
  attr OnVolumechange value = unsafeAttribute $ This $ pure $
    { key: "volumechange", value: cb' value }
instance Attr anything OnVolumechange (Event.Event  Cb ) where
  attr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "volumechange", value: cb' value }

instance Attr anything OnVolumechange (ST.ST Global.Global  Cb ) where
  attr OnVolumechange iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "volumechange", value: cb' value }

instance Attr anything OnVolumechange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both (pure 
    { key: "volumechange", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "volumechange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnVolumechange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnVolumechange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "volumechange", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "volumechange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnVolumechange  (Effect Unit)  where
  attr OnVolumechange value = unsafeAttribute $ This $ pure $
    { key: "volumechange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnVolumechange (Event.Event  (Effect Unit) ) where
  attr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnVolumechange (ST.ST Global.Global  (Effect Unit) ) where
  attr OnVolumechange iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "volumechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnVolumechange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both (pure 
    { key: "volumechange", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "volumechange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnVolumechange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnVolumechange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "volumechange", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "volumechange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnVolumechange  (Effect Boolean)  where
  attr OnVolumechange value = unsafeAttribute $ This $ pure $
    { key: "volumechange", value: cb' (Cb (const value)) }
instance Attr anything OnVolumechange (Event.Event  (Effect Boolean) ) where
  attr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const value)) }

instance Attr anything OnVolumechange (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnVolumechange iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "volumechange", value: cb' (Cb (const value)) }

instance Attr everything OnVolumechange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnVolumechange bothValues = unsafeAttribute $ Both (pure 
    { key: "volumechange", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "volumechange", value: unset' })
instance Attr everything OnVolumechange (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnVolumechange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "volumechange", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "volumechange", value: unset' })
instance Attr everything OnVolumechange  Unit  where
  attr OnVolumechange _ = unsafeAttribute $ This $ pure $
    { key: "volumechange", value: unset' }
instance Attr everything OnVolumechange (Event.Event  Unit ) where
  attr OnVolumechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "volumechange", value: unset' }

instance Attr everything OnVolumechange (ST.ST Global.Global  Unit ) where
  attr OnVolumechange iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "volumechange", value: unset' }
