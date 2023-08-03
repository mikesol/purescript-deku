module Deku.DOM.Attr.OnWaiting where

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

data OnWaiting = OnWaiting

instance Attr anything OnWaiting (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnWaiting bothValues = unsafeAttribute $ Both (pure 
    { key: "waiting", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "waiting", value: cb' value })
instance Attr anything OnWaiting (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnWaiting (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "waiting", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "waiting", value: cb' value })
instance Attr anything OnWaiting  Cb  where
  attr OnWaiting value = unsafeAttribute $ This $ pure $
    { key: "waiting", value: cb' value }
instance Attr anything OnWaiting (Event.Event  Cb ) where
  attr OnWaiting eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "waiting", value: cb' value }

instance Attr anything OnWaiting (ST.ST Global.Global  Cb ) where
  attr OnWaiting stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "waiting", value: cb' value }

instance Attr anything OnWaiting (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnWaiting bothValues = unsafeAttribute $ Both (pure 
    { key: "waiting", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "waiting", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnWaiting (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnWaiting (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "waiting", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "waiting", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnWaiting  (Effect Unit)  where
  attr OnWaiting value = unsafeAttribute $ This $ pure $
    { key: "waiting", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnWaiting (Event.Event  (Effect Unit) ) where
  attr OnWaiting eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWaiting (ST.ST Global.Global  (Effect Unit) ) where
  attr OnWaiting stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWaiting (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnWaiting bothValues = unsafeAttribute $ Both (pure 
    { key: "waiting", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "waiting", value: cb' (Cb (const value)) }
    )
instance Attr anything OnWaiting (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnWaiting (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "waiting", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "waiting", value: cb' (Cb (const value)) }
    )
instance Attr anything OnWaiting  (Effect Boolean)  where
  attr OnWaiting value = unsafeAttribute $ This $ pure $
    { key: "waiting", value: cb' (Cb (const value)) }
instance Attr anything OnWaiting (Event.Event  (Effect Boolean) ) where
  attr OnWaiting eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const value)) }

instance Attr anything OnWaiting (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnWaiting stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const value)) }

instance Attr everything OnWaiting (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnWaiting bothValues = unsafeAttribute $ Both (pure 
    { key: "waiting", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "waiting", value: unset' })
instance Attr everything OnWaiting (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnWaiting (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "waiting", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "waiting", value: unset' })
instance Attr everything OnWaiting  Unit  where
  attr OnWaiting _ = unsafeAttribute $ This $ pure $
    { key: "waiting", value: unset' }
instance Attr everything OnWaiting (Event.Event  Unit ) where
  attr OnWaiting eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "waiting", value: unset' }

instance Attr everything OnWaiting (ST.ST Global.Global  Unit ) where
  attr OnWaiting stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "waiting", value: unset' }
