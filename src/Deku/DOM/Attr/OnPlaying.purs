module Deku.DOM.Attr.OnPlaying where

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

data OnPlaying = OnPlaying

instance Attr anything OnPlaying (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPlaying bothValues = unsafeAttribute $ Both (pure 
    { key: "playing", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "playing", value: cb' value })
instance Attr anything OnPlaying (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPlaying (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "playing", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "playing", value: cb' value })
instance Attr anything OnPlaying  Cb  where
  attr OnPlaying value = unsafeAttribute $ This $ pure $
    { key: "playing", value: cb' value }
instance Attr anything OnPlaying (Event.Event  Cb ) where
  attr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "playing", value: cb' value }

instance Attr anything OnPlaying (ST.ST Global.Global  Cb ) where
  attr OnPlaying stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "playing", value: cb' value }

instance Attr anything OnPlaying (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPlaying bothValues = unsafeAttribute $ Both (pure 
    { key: "playing", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "playing", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPlaying (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPlaying (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "playing", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "playing", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPlaying  (Effect Unit)  where
  attr OnPlaying value = unsafeAttribute $ This $ pure $
    { key: "playing", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPlaying (Event.Event  (Effect Unit) ) where
  attr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlaying (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPlaying stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "playing", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlaying (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPlaying bothValues = unsafeAttribute $ Both (pure 
    { key: "playing", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "playing", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPlaying (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPlaying (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "playing", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "playing", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPlaying  (Effect Boolean)  where
  attr OnPlaying value = unsafeAttribute $ This $ pure $
    { key: "playing", value: cb' (Cb (const value)) }
instance Attr anything OnPlaying (Event.Event  (Effect Boolean) ) where
  attr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const value)) }

instance Attr anything OnPlaying (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPlaying stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "playing", value: cb' (Cb (const value)) }

instance Attr everything OnPlaying (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPlaying bothValues = unsafeAttribute $ Both (pure 
    { key: "playing", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "playing", value: unset' })
instance Attr everything OnPlaying (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPlaying (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "playing", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "playing", value: unset' })
instance Attr everything OnPlaying  Unit  where
  attr OnPlaying _ = unsafeAttribute $ This $ pure $
    { key: "playing", value: unset' }
instance Attr everything OnPlaying (Event.Event  Unit ) where
  attr OnPlaying eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "playing", value: unset' }

instance Attr everything OnPlaying (ST.ST Global.Global  Unit ) where
  attr OnPlaying stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "playing", value: unset' }
