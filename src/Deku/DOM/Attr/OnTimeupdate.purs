module Deku.DOM.Attr.OnTimeupdate where

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

data OnTimeupdate = OnTimeupdate

instance Attr anything OnTimeupdate (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTimeupdate bothValues = unsafeAttribute $ Both (pure 
    { key: "timeupdate", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "timeupdate", value: cb' value })
instance Attr anything OnTimeupdate (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnTimeupdate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "timeupdate", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "timeupdate", value: cb' value })
instance Attr anything OnTimeupdate  Cb  where
  attr OnTimeupdate value = unsafeAttribute $ This $ pure $
    { key: "timeupdate", value: cb' value }
instance Attr anything OnTimeupdate (Event.Event  Cb ) where
  attr OnTimeupdate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "timeupdate", value: cb' value }

instance Attr anything OnTimeupdate (ST.ST Global.Global  Cb ) where
  attr OnTimeupdate stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "timeupdate", value: cb' value }

instance Attr anything OnTimeupdate (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTimeupdate bothValues = unsafeAttribute $ Both (pure 
    { key: "timeupdate", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "timeupdate", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTimeupdate (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnTimeupdate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "timeupdate", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "timeupdate", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTimeupdate  (Effect Unit)  where
  attr OnTimeupdate value = unsafeAttribute $ This $ pure $
    { key: "timeupdate", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTimeupdate (Event.Event  (Effect Unit) ) where
  attr OnTimeupdate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTimeupdate (ST.ST Global.Global  (Effect Unit) ) where
  attr OnTimeupdate stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTimeupdate (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTimeupdate bothValues = unsafeAttribute $ Both (pure 
    { key: "timeupdate", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "timeupdate", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTimeupdate (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnTimeupdate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "timeupdate", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "timeupdate", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTimeupdate  (Effect Boolean)  where
  attr OnTimeupdate value = unsafeAttribute $ This $ pure $
    { key: "timeupdate", value: cb' (Cb (const value)) }
instance Attr anything OnTimeupdate (Event.Event  (Effect Boolean) ) where
  attr OnTimeupdate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const value)) }

instance Attr anything OnTimeupdate (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnTimeupdate stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const value)) }

instance Attr everything OnTimeupdate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTimeupdate bothValues = unsafeAttribute $ Both (pure 
    { key: "timeupdate", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "timeupdate", value: unset' })
instance Attr everything OnTimeupdate (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnTimeupdate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "timeupdate", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "timeupdate", value: unset' })
instance Attr everything OnTimeupdate  Unit  where
  attr OnTimeupdate _ = unsafeAttribute $ This $ pure $
    { key: "timeupdate", value: unset' }
instance Attr everything OnTimeupdate (Event.Event  Unit ) where
  attr OnTimeupdate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "timeupdate", value: unset' }

instance Attr everything OnTimeupdate (ST.ST Global.Global  Unit ) where
  attr OnTimeupdate stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "timeupdate", value: unset' }
