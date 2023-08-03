module Deku.DOM.Attr.OnDrop where

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

data OnDrop = OnDrop

instance Attr anything OnDrop (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDrop bothValues = unsafeAttribute $ Both (pure 
    { key: "drop", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "drop", value: cb' value })
instance Attr anything OnDrop (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnDrop (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "drop", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "drop", value: cb' value })
instance Attr anything OnDrop  Cb  where
  attr OnDrop value = unsafeAttribute $ This $ pure $
    { key: "drop", value: cb' value }
instance Attr anything OnDrop (Event.Event  Cb ) where
  attr OnDrop eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drop", value: cb' value }

instance Attr anything OnDrop (ST.ST Global.Global  Cb ) where
  attr OnDrop stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "drop", value: cb' value }

instance Attr anything OnDrop (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDrop bothValues = unsafeAttribute $ Both (pure 
    { key: "drop", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "drop", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDrop (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnDrop (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "drop", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "drop", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDrop  (Effect Unit)  where
  attr OnDrop value = unsafeAttribute $ This $ pure $
    { key: "drop", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDrop (Event.Event  (Effect Unit) ) where
  attr OnDrop eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drop", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrop (ST.ST Global.Global  (Effect Unit) ) where
  attr OnDrop stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "drop", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrop (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDrop bothValues = unsafeAttribute $ Both (pure 
    { key: "drop", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "drop", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDrop (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnDrop (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "drop", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "drop", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDrop  (Effect Boolean)  where
  attr OnDrop value = unsafeAttribute $ This $ pure $
    { key: "drop", value: cb' (Cb (const value)) }
instance Attr anything OnDrop (Event.Event  (Effect Boolean) ) where
  attr OnDrop eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drop", value: cb' (Cb (const value)) }

instance Attr anything OnDrop (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnDrop stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "drop", value: cb' (Cb (const value)) }

instance Attr everything OnDrop (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDrop bothValues = unsafeAttribute $ Both (pure  { key: "drop", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "drop", value: unset' })
instance Attr everything OnDrop (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnDrop (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "drop", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "drop", value: unset' })
instance Attr everything OnDrop  Unit  where
  attr OnDrop _ = unsafeAttribute $ This $ pure $ { key: "drop", value: unset' }
instance Attr everything OnDrop (Event.Event  Unit ) where
  attr OnDrop eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "drop", value: unset' }

instance Attr everything OnDrop (ST.ST Global.Global  Unit ) where
  attr OnDrop stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "drop", value: unset' }
